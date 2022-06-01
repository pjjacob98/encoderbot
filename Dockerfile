FROM alpine:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3 python3-dev py3-pip
RUN apk add --no-cache bash procps cargo build-base boost-dev sudo cmake wget curl mkvtoolnix mediainfo opencl-headers opencl-icd-loader-dev autoconf automake libtool cython pkgconf git nasm yasm fftw-dev zlib-dev x264 x265
RUN git clone https://github.com/sekrit-twc/zimg ; cd zimg ; ./autogen.sh ; ./configure ; make ; make install ; rm -rfv ../zimg
RUN git clone https://github.com/vapoursynth/vapoursynth.git ; cd vapoursynth ; ./autogen.sh ; ./configure ; make ; make install ; rm -rfv ../vapoursynth
RUN wget -O adjust.py "https://www.googleapis.com/drive/v3/files/1-zp7j0nDeWZm7NNrf87JXLUbkFD8Aq17?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "adjust.py" "/usr/lib/python3.10/site-packages"
RUN wget -O havsfunc.py "https://www.googleapis.com/drive/v3/files/10-aTjV9EO6oHjIQEWOPgI2WPV6uFZVBC?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "havsfunc.py" "/usr/lib/python3.10/site-packages"
RUN wget -O mvsfunc.py "https://www.googleapis.com/drive/v3/files/102IJfWi0pxMcaHm6Bi00A-OjyOadeOLh?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "mvsfunc.py" "/usr/lib/python3.10/site-packages"
RUN wget -O nnedi3_resample.py "https://www.googleapis.com/drive/v3/files/104alWHFL008ZCgTBU-pFUzYrGVavv5mI?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "nnedi3_resample.py" "/usr/lib/python3.10/site-packages"
RUN wget -O nnedi3aa.py "https://www.googleapis.com/drive/v3/files/1079Eo19JfZyfOZR2XZK_4Yk3aAzZMQaM?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "nnedi3aa.py" "/usr/lib/python3.10/site-packages"
RUN git clone https://github.com/pjjacob98/libs
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash", "start.sh"]
