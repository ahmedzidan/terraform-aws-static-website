## Resources:
- S3 bucket
- Cloudfront distribution
- Object uploader
## Requirements

terraform 0.12 and above

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | bucket name | `string` | n/a | yes |
| folder\_path | folder path to be uploaded | `string` | n/a | yes |
| tags | tags to be added for the resources | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| domain | domain name for cloudfront distribution |
