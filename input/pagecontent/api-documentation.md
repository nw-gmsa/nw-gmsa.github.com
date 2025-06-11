
## Network access

This API is available on the [Health and Social Care Network (HSCN)](https://digital.nhs.uk/services/health-and-social-care-network)

## Security and authorisation

This API has two access modes:

- unrestricted access (DEVELOMENT)
- OAuth2 [client-credentials](https://www.oauth.com/oauth2-servers/access-tokens/client-credentials/) (INTEGRATION)

### OAuth2 Configuration

#### Request

```aiignore
GET {{oauth2}}/.well-known/openid-configuration
```

#### Response

```json
{
  "issuer": "https://127.0.0.1/healthconnect/oauth2",
  "authorization_endpoint": "https://127.0.0.1/healthconnect/oauth2/authorize",
  "token_endpoint": "https://127.0.0.1/healthconnect/oauth2/token",
  "userinfo_endpoint": "https://127.0.0.1/healthconnect/oauth2/userinfo",
  "revocation_endpoint": "https://127.0.0.1/healthconnect/oauth2/revocation",
  "introspection_endpoint": "https://127.0.0.1/healthconnect/oauth2/introspection",
  "jwks_uri": "https://127.0.0.1/healthconnect/oauth2/jwks",
  "registration_endpoint": "https://127.0.0.1/healthconnect/oauth2/register",
  "end_session_endpoint": "https://127.0.0.1/healthconnect/oauth2/logout",
  "scopes_supported": [
    "openid",
    "profile",
    "email",
    "address",
    "phone",
    "system/*.*"
  ],
  "response_modes_supported": [
    "query",
    "fragment",
    "form_post"
  ],
  "code_challenge_methods_supported": [
    "plain",
    "S256"
  ],
  "grant_types_supported": [
    "client_credentials",
    "jwt_authorization",
    "refresh_token"
  ]
}
```

### OAuth2 Token (client credentials)

#### Request

Body is the following values in x-www-form-urlencoded format

| Key | Value              |
|-----|--------------------|
| grant_type | client_credentials |
| scope | system/*.* | 

```aiignore
GET {{oauth2}}/token
Authorization: Basic {base64 clientid and clientsecret}
Content-Type: application/x-www-form-urlencoded
```

#### Response

```json
{
    "access_token": "REMOVED",
    "token_type": "bearer",
    "expires_in": 3600,
    "scope": "system/*.*"
}
```

### OAuth2 Introspection

#### Request

Body is the following values in x-www-form-urlencoded format

| Key   | Value             |
|-------|-------------------|
| token | {token} to verify |

```aiignore
POST {{oauth2}}/introspection
Authorization: Basic {base64 clientid and clientsecret}
Content-Type: application/x-www-form-urlencoded
```

#### Response

```json
{
    "active": false
}
```

## Environment and testing

| Environment         | Service                           | Base Url                                 | Capability Statement 'OAS'                                                |
|---------------------|-----------------------------------|------------------------------------------|--------------------------------------------------------------------------|
| Dev                 |                                   |                                          |                                                                          |
|                     | Regional Integration Engine (RIE) | http://10.165.194.216/gentiedev/ESB      | [CapabilityStatement](CapabilityStatement-RegionalIntegrationEngine.html) |
| Integration Testing |                                   |                                          |                                                                          |
|                     | Regional Integration Engine (RIE) | https://10.165.194.217/gentietest/ESB    | [CapabilityStatement](CapabilityStatement-RegionalIntegrationEngine.html) |
|                     | Regional OAuth2 Server            | https://10.165.194.217/gentietest/oauth2 |                                                                          | 

### Testing

All FHIR payloads **MUST** conform to this Implementation Guide. 
This IG is available in [NPM Package](package.tgz) for which is compatible with FHIR Validation tools, see [Testing](testing.html) for more details.
