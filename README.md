# Serverless Framework Resource

Deploys services using the [Serverless Framework](https://serverless.com). Currently only supports [AWS](https://aws.amazon.com).

## Source Configuration

* `aws_access_key_id`: *Required.* AWS access key to use for deployment
  credentials.

* `aws_secret_access_key`: *Required.* AWS secret key to use for deployment

* `aws_region`: *Optional.* AWS region to deploy to. Defaults to `us-east-1`.

## Behavior

This is a write-only resource, so `in` and `check` are both no-op.

### `out`: Push an image, or build and push a `Dockerfile`.

Deploy a service using `serverless deploy`.

#### Parameters

* `service`: *Required.* A name for the service.
* `stage`: *Optional.* Deployment stage. Defaults to `dev` per the Serverless defaults.
* `package`: *Optional.* A package created with `serverless package` to deploy.
* `env`: *Optional.*  Environment variables to pass through to the servless deployment.
