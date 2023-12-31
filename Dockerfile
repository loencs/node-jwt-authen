# This file is generated by Nx.
#
# Build the docker image with `npx nx docker-build authorize-jwt-module`.
# Tip: Modify "docker-build" options in project.json to change docker build args.
#
# Run the container with `docker run -p 3000:3000 -t authorize-jwt-module`.
FROM docker.io/node:lts-alpine

ENV HOST=0.0.0.0
ENV PORT=3000

WORKDIR /app

RUN addgroup --system authorize-jwt-module && \
          adduser --system -G authorize-jwt-module authorize-jwt-module

COPY dist/authorize-jwt-module authorize-jwt-module
RUN chown -R authorize-jwt-module:authorize-jwt-module .

# You can remove this install step if you build with `--bundle` option.
# The bundled output will include external dependencies.
RUN npm --prefix authorize-jwt-module --omit=dev -f install

CMD [ "node", "authorize-jwt-module" ]
