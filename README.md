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
```
module "static_website" {
  source = "../"
  bucket_name = "zidan-static-website"
  folder_path = "path to the folder to upload all the files inside it"
  tags = {
    Name="my-static-website"
  }
}
```
