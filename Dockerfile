FROM alpine:edge

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev
RUN apk add --no-cache py3-pip
RUN apk add --no-cache bash procps cargo
RUN apk add --no-cache build-base boost-dev
RUN apk add --no-cache sudo cmake wget curl ffmpeg mkvtoolnix mediainfo
RUN apk add --no-cache opencl-headers opencl-icd-loader-dev
RUN apk add --no-cache autoconf automake libtool cython pkgconf git nasm yasm fftw-dev zlib-dev meson
RUN git clone https://github.com/sekrit-twc/zimg ; cd zimg ; ./autogen.sh ; ./configure ; make > /dev/null 2>&1 ; make install
RUN git clone https://github.com/vapoursynth/vapoursynth.git ; cd vapoursynth ; ./autogen.sh ; ./configure ; make > /dev/null 2>&1 ; make install
RUN git clone https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3 ; cd VapourSynth-EEDI3 ; meson build ; ninja -C build
RUN wget -O adjust.py "https://www.googleapis.com/drive/v3/files/118lZQzqo6dHKLH_lTiXJMGOb6MJ7cwYi?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "adjust.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O havsfunc.py "https://www.googleapis.com/drive/v3/files/115cp64FBg--UP5p-87_1Tc5bQW0VHPc9?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "havsfunc.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O mvsfunc.py "https://www.googleapis.com/drive/v3/files/1147iKrs1vKzGfMvblA0L_2wVAIRiPG_l?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "mvsfunc.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O nnedi3_resample.py "https://www.googleapis.com/drive/v3/files/10yh4KfWI1NX6rqrLoSm1zRINbzgej4e4?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "nnedi3_resample.py" "/usr/local/lib/python3.10/site-packages"
RUN wget -O nnedi3aa.py "https://www.googleapis.com/drive/v3/files/1142Q-NKvQF7w840gn6dL9eUmmfpIynh5?alt=media&key=AIzaSyB3lrh7-RHcAZIZnc68i5_-sQdvmrDyIrw" ; mv "nnedi3aa.py" "/usr/local/lib/python3.10/site-packages"
RUN git clone https://github.com/pjjacob98/libs

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
