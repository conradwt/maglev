require File.expand_path('simple', File.dirname(__FILE__))

require 'socket'
require 'fcntl'

# Just basically test that various methods are present and the format of
# returned info.

tcp_server = TCPServer.open('0.0.0.0', 0)
test(tcp_server.class, TCPServer, 'TCPServer.open with 0 for port')

addr = tcp_server.addr
# Currently, Socket impl is not complete.  Only check fields we know will
# be ok.
test(addr[0], "AF_INET", 'TCPSocket.addr[0]')
test(addr[1].class, Fixnum, 'TCPSocket.addr[1]')  # Randomly assigned port
# test(addr[2], "0.0.0.0", 'TCPSocket.addr[2]')   # we have nil
test(addr[3], "0.0.0.0", 'TCPSocket.addr[3]')

status = tcp_server.fcntl(Fcntl::F_SETFD, Fcntl::FD_CLOEXEC)
test(status, 0, 'fcntl(Fcntl::F_SETFD, Fcntl::FD_CLOEXEC)')

tcp_server.close

# Ensure that the port parameter can be a string that represents a number
tcp_server = TCPServer.open('localhost', '7654')
test(tcp_server.nil?, false, 'Port numbers as strings')
tcp_server.close

report
