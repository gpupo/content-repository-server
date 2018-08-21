# Content Repository Server

Custom install of Apache Jackrabbit ``2.12.9`` Docker image on top of Tomcat ``8.5``


## Usage

Run without configuration

    docker run -p 8080:8080 gpupo/content-repository-server

Open [Jackrabbit JCR Server dashboard](https://localhost:8080)

For run with custom ``repository`` config, like Mysql persistense, check [sample directory](https://github.com/gpupo/content-repository-server/tree/master/sample)

## Credentials

Default user is *admin* with *admin* password

## Examples

See [Jackalope Jackrabbit by example](https://github.com/gpupo/jackalope-jackrabbit-by-example) and [content-butler](https://github.com/gpupo/content-butler)
