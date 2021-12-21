terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"
  
    backend "s3" {
       bucket = "[kurts-s3-terraform-01]"
       key    = "[f8a128f8-a497-4cd5-8d10-a9ed80a38675]"
       region = "east-us-2"
   }
}
resource "aws_s3_bucket" "s3Bucket" {
     bucket = "[BUCKET_NAME_HERE]"
     acl       = "public-read"

     policy  = <<EOF
{
     "id" : "MakePublic",
   "version" : "2012-10-17",
   "statement" : [
      {
         "action" : [
             "s3:GetObject"
          ],
         "effect" : "Allow",
         "resource" : "arn:aws:s3:::[BUCKET_NAME_HERE]/*",
         "principal" : "*"
      }
    ]
  }
EOF

   website {
       index_document = "index.html"
   }
}
provider "aws" {
  version = "~>3.0"
  region  = "east-us-2"
}
