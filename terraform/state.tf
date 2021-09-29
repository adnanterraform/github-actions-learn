
# resource "aws_s3_bucket" "s3Bucket" {
#   bucket = "adnan-github-action-resources"
#   acl    = "public-read"

#   policy = <<EOF
# {
#   "Id": "MakePublic",
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": [
#         "s3:GetObject"
#       ],
#       "Effect": "Allow",
#       "Resource": "arn:aws:s3:::adnan-github-action-resources/*",
#       "Principal": "*"
#     }
#   ]
# }
# EOF

#   website {
#     index_document = "hello.html"
#   }
# }