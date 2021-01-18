data = bytearray([0xAB] * 1474560) # create a 1440kb drive
                                   # in drive terms this is:
                                   # 80 cylinders
                                   # 2 heads
                                   # 18 sectors per track

file = open('drive.img', 'wb') # write data to file
file.write(data)
file.close()