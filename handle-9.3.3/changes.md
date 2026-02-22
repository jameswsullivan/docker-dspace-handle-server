### File Changes

The following files under `lib/servletContainer` are updated to Jetty 9.4.58.v20250814:

- `http2-common-9.4.15.v20190215.jar` -> `http2-common-9.4.58.v20250814.jar`
- `http2-hpack-9.4.15.v20190215.jar` -> `http2-hpack-9.4.58.v20250814.jar`
- `http2-server-9.4.15.v20190215.jar` -> `http2-server-9.4.58.v20250814.jar`
- `jetty-alpn-java-server-9.4.15.v20190215.jar` -> `jetty-alpn-java-server-9.4.58.v20250814.jar`
- `jetty-alpn-server-9.4.15.v20190215.jar` -> `jetty-alpn-server-9.4.58.v20250814.jar`
- `jetty-annotations-9.4.15.v20190215.jar` -> `jetty-annotations-9.4.58.v20250814.jar`
- `jetty-continuation-9.4.15.v20190215.jar` -> `jetty-continuation-9.4.58.v20250814.jar`
- `jetty-deploy-9.4.15.v20190215.jar` -> `jetty-deploy-9.4.58.v20250814.jar`
- `jetty-http-9.4.15.v20190215.jar` -> `jetty-http-9.4.58.v20250814.jar`
- `jetty-io-9.4.15.v20190215.jar` -> `jetty-io-9.4.58.v20250814.jar`
- `jetty-jndi-9.4.15.v20190215.jar` -> `jetty-jndi-9.4.58.v20250814.jar`
- `jetty-plus-9.4.15.v20190215.jar` -> `jetty-plus-9.4.58.v20250814.jar`
- `jetty-security-9.4.15.v20190215.jar` -> `jetty-security-9.4.58.v20250814.jar`
- `jetty-server-9.4.15.v20190215.jar` -> `jetty-server-9.4.58.v20250814.jar`
- `jetty-servlet-9.4.15.v20190215.jar` -> `jetty-servlet-9.4.58.v20250814.jar`
- `jetty-servlets-9.4.15.v20190215.jar` -> `jetty-servlets-9.4.58.v20250814.jar`
- `jetty-util-9.4.15.v20190215.jar` -> `jetty-util-9.4.58.v20250814.jar`
- `jetty-webapp-9.4.15.v20190215.jar` -> `jetty-webapp-9.4.58.v20250814.jar`
- `jetty-xml-9.4.15.v20190215.jar` -> `jetty-xml-9.4.58.v20250814.jar`

### Adding log4j
The following files are added to `lib/servletContainer` for log4j:

- `log4j-1.2-api-2.25.3.jar`
- `log4j-api-2.25.3.jar`
- `log4j-core-2.25.3.jar`

This provides support for [an updated version of the DSpace Remote Handle Resolver plugin](https://github.com/jameswsullivan/Remote-Handle-Resolver/commit/a135e82ec000fc247e5fc3eb861ef4648e0eb605) that uses the latest log4j 2.25.3 (update from version 1.2.17).

### Vulnerabilities Mitigated

- [CVE-2024-22201](https://avd.aquasec.com/nvd/cve-2024-22201) - High
- [CVE-2025-5115](https://avd.aquasec.com/nvd/cve-2025-5115) - High
- [CVE-2023-36478](https://avd.aquasec.com/nvd/cve-2023-36478) - High
- [CVE-2022-2048](https://avd.aquasec.com/nvd/cve-2022-2048) - High
- [CVE-2021-28165](https://avd.aquasec.com/nvd/cve-2021-28165) - High
- [CVE-2024-13009](https://avd.aquasec.com/nvd/cve-2024-13009) - High
- [CVE-2020-27216](https://avd.aquasec.com/nvd/cve-2020-27216) - High
- [CVE-2023-44487](https://avd.aquasec.com/nvd/cve-2023-44487) - Medium
- [CVE-2023-44487](https://avd.aquasec.com/nvd/cve-2023-44487) - Medium
- [CVE-2023-40167](https://avd.aquasec.com/nvd/cve-2023-40167) - Medium
- [CVE-2024-6763](https://avd.aquasec.com/nvd/cve-2024-6763) - Medium
- [CVE-2019-10241](https://avd.aquasec.com/nvd/cve-2019-10241) - Medium
- [CVE-2019-10246](https://avd.aquasec.com/nvd/cve-2019-10246) - Medium
- [CVE-2019-10247](https://avd.aquasec.com/nvd/cve-2019-10247) - Medium
- [CVE-2020-27218](https://avd.aquasec.com/nvd/cve-2020-27218) - Medium
- [CVE-2020-27223](https://avd.aquasec.com/nvd/cve-2020-27223) - Medium
- [CVE-2023-26048](https://avd.aquasec.com/nvd/cve-2023-26048) - Medium
- [CVE-2024-8184](https://avd.aquasec.com/nvd/cve-2024-8184) - Medium
- [CVE-2021-28169](https://avd.aquasec.com/nvd/cve-2021-28169) - Medium
- [CVE-2024-9823](https://avd.aquasec.com/nvd/cve-2024-9823) - Medium
- [CVE-2022-2047](https://avd.aquasec.com/nvd/cve-2022-2047) - Low
- [CVE-2021-34428](https://avd.aquasec.com/nvd/cve-2021-34428) - Low
- [CVE-2023-26049](https://avd.aquasec.com/nvd/cve-2023-26049) - Low
- [CVE-2023-36479](https://avd.aquasec.com/nvd/cve-2023-36479) - Low
- [GHSA-58qw-p7qm-5rvh](https://github.com/advisories/GHSA-58qw-p7qm-5rvh) - Low

