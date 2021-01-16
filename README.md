## Resources:
- S3 bucket
- Cloudfront distribution
- Object uploader
## Requirements

terraform 0.12 and above

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | bucket name | `string` | n/a | yes |
| folder\_path | file path to be uploaded | `string` | n/a | yes |
| tags | tags for the subnet | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| domain | cloudfront distribution domain name |

## Example.
you can get the full example from example folder
