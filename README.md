## Resources:
![structure](https://drive.google.com/uc?id=1CwBPDPtJSPZmevus8QEddky6VIyXFstL)
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

## Example
```
module "static-website" {
  source  = "ahmedzidan/static-website/aws"
  version = "1.0.1"
  bucket_name = ""
  folder_path = ""
  tags = {}
}
```
- You can see full example from [here](https://github.com/ahmedzidan/terraform-aws-static-website/tree/master/example)

## Mime types
- we are using the mime type from [Internet Assigned Numbers Authority (IANA) official website](https://www.iana.org/assignments/media-types/media-types.xhtml).
