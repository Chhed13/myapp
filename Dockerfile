FROM golang

WORKDIR /go/src/github.com/chhed13/myapp/
RUN go get -d -v github.com/takama/router
COPY version/version.go version/version.go
COPY myapp.go .

RUN go build myapp.go

FROM scratch

ENV MYAPP_SERVICE_PORT 8080

EXPOSE $MYAPP_SERVICE_PORT

COPY  --from=0 /go/src/github.com/chhed13/myapp .

CMD ["/myapp"]
