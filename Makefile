.PHONY: all
all:
	@if ! [ -f sh4twbox-usb-auto-0.5.1-target.tgz ]; then \
		echo "File 'sh4twbox-usb-auto-0.5.1-target.tgz' not exist"; \
		echo "You may extract it from sh4twbox-usb-auto-0.5.1.dd"; \
		exit 1; \
		fi
	-tar zxf sh4twbox-usb-auto-0.5.1-target.tgz
	rm mnt_system/etc/init.d/*
	rm mnt_system/root/*
	rm mnt_system/dev/*
	rmdir mnt_system/mnt_system
	cp -a target/* mnt_system/
	tar --numeric-owner --owner=0 --group=0 -c mnt_system | gzip -9 -c > target.tgz

.PHONY: clean
clean:
	rm -fR mnt_system
	rm -f target.tgz

