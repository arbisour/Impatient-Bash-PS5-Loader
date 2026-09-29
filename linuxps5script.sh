export PS5_HOST=192.168.1.177     # ps5 IP here
export PS5_PORT=9021

echo "kstuff"
export PS5_PAYLOAD=kstuff.elf
nc -i1 $PS5_HOST $PS5_PORT < $PS5_PAYLOAD
echo" etahen"
export PS5_PAYLOAD=etaHEN.elf #replace payload here
nc -i1 $PS5_HOST $PS5_PORT < $PS5_PAYLOAD
echo"shadowmountplus"
export PS5_PAYLOAD=shadowmountplus.elf
nc -i1 $PS5_HOST $PS5_PORT < $PS5_PAYLOAD

# copy and paste these lines for more payloads,
# replace payload.elf with whatever.

#export PS5_PAYLOAD=payload.elf
#nc -i1 $PS5_HOST $PS5_PORT < $PS5_PAYLOAD
