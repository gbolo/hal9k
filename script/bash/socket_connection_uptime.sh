function suptime() {
    local addr=${1:?Specify the remote IPv4 address}
    local port=${2:?Specify the remote port number}
    # convert the provided address to hex format
    local hex_addr=$(python -c "import socket, struct; print(hex(struct.unpack('<L', socket.inet_aton('$addr'))[0])[2:10].upper().zfill(8))")
    local hex_port=$(python -c "print(hex($port)[2:].upper().zfill(4))")
    # get the PID of the owner process
    local pid=$(netstat -ntp 2>/dev/null | awk '$6 == "ESTABLISHED" && $5 == "'$addr:$port'"{sub("/.*", "", $7); print $7}')
    [ -z "$pid" ] && { echo 'Address does not match' 2>&1; return 1; }
    # get the inode of the socket
    local inode=$(awk '$4 == "01" && $3 == "'$hex_addr:$hex_port'" {print $10}' /proc/net/tcp)
    [ -z "$inode" ] && { echo 'Cannot lookup the socket' 2>&1; return 1; }
    # query the inode status change time
    local timestamp=$(find /proc/$pid/fd -lname "socket:\[$inode\]" -printf %T@)
    [ -z "$timestamp" ] && { echo 'Cannot fetch the timestamp' 2>&1; return 1; }
    # compute the time difference
    LANG=C printf '%s (%.2fs ago)\n' "$(date -d @$timestamp)" $(bc <<<"$(date +%s.%N) - $timestamp")
}

# suptime 10.113.0.40 38040 
