#!/bin/bash

# Script gets an sdl lesson file, unzips it and puts a makefile in folder
NAME=$1
ZIPNAME=$1.zip

if [ -f ~/Downloads/$ZIPNAME ]; then
    echo "###Starting script...###"
    echo "###Getting file $ZIPNAME...###"
    cp ~/Downloads/$ZIPNAME .
    echo "###Unzipping...###"
    unzip $ZIPNAME
    rm $ZIPNAME
    echo "###Copying makefile...###"
    cp makefile $NAME
    echo "OBJS=$NAME.cpp" >> $NAME/makefile
    echo "###Fixing includes in source file...###"
    sed -i 's/<SDL/<SDL2\/SDL/g' $NAME/$NAME.cpp 
    echo "###Fixing image paths in source file...###"
    sed -i "s/$NAME\///g" $NAME/$NAME.cpp 
    echo "###Changing folder permissions...###"
    chmod 755 $NAME
    echo "###Done, exiting...###"
else
    echo "### No such file! Exiting... ###"
fi
