FROM alpine AS build

RUN apk update && apk add gcc musl-dev
ADD . /src
RUN cc -Wall -static /src/addmount.c -o /src/addmount

FROM docker:dind
RUN apk update && apk add jq
COPY --from=build /src/addmount /src/script.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/script.sh"]
