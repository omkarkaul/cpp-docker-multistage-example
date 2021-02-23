FROM alpine:latest as BUILD
RUN apk add -c --no-cache g++
COPY . /usr/src/build
WORKDIR /usr/src/build
RUN g++ main.cpp -O2 -static -o main.o

FROM alpine:latest as RUN
COPY --from=BUILD /usr/src/build /usr/src/run
WORKDIR /usr/src/run
ENTRYPOINT ["./main.o"]

