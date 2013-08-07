#set KERNELDIR and CROSS_COMPILE path yourself
#
ifneq   ($(KERNELRELEASE),) 
	#obj-m   :=   pixcir_i2c_ts.o
	obj-m	:= pixcir_hid_mt.o
else 
	#KERNELDIR   :=	/usr/src/linux-2.6.32
	KERNELDIR   :=   /home/pixcir/android-x86/out/target/product/eeepc/obj/kernel
	#KERNELDIR   :=   /home/pixcir/linux2.6.32-for-mini2440/linux-2.6.32.2
	PWD   :=   $(shell pwd)
	#CROSS_ARCH	:= ARCH=arm CROSS_COMPILE=/usr/local/arm/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-
default: 
	$(MAKE) $(CROSS_ARCH) -C  $(KERNELDIR)   M=$(PWD)   modules 

install: 
	$(MAKE)  $(CROSS_ARCH) -C  $(KERNELDIR)   M=$(PWD)   modules_install 
clean: 
	rm   -rf   *.o   *~   core   .depend   .*.cmd   *.ko   *.mod.c   .tmp_versions	*.symvers	*.d	*.markers	*.order

.PHONY:   modules   modules_install   clean  main
endif
