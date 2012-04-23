#!/bin/sh

do_update() 
{
    sudo -- update-alternatives --install /usr/bin/$name $name $NEWDIR/bin/$name $PRIORITY --slave /usr/share/man/man1/$name.1.gz $name.1.gz $NEWDIR/man/man1/$name.1.gz
}

compress_mans()
{
}

# update-alternatives --list [name]
# update-alternatives --display [name]
# update-alternatives --remove [name] [path]
# update-alternatives --remove-all [name]


PRIORITY=1001
JDK_HOME=/usr/lib/jvm/java-6-sun


NEWDIR=$JDK_HOME

# preparations
# compress man's
gzip -9 $NEWDIR/man/man1/*.1 >/dev/null 2>&1 &

name=java
#sudo -- update-alternatives --install /usr/bin/$name $name $NEWDIR/bin/$name $PRIORITY --slave /usr/share/man/man1/$name.1.gz $name.1.gz $NEWDIR/man/man1/$name.1.gz
do_update

name=javac
do_update

name=keytool
do_update
