resource "aws_s3_bucket" "demo" {
	bucket = "demo-2441139"
	tags   = {
		Description = "Demo for Terraform S3"
	}
}

resource "aws_s3_object" "demo-2024" {
	content = "/home/rajarshi/terraform/aws/s3_test.txt"
	key     = "s3_test.txt"
	bucket	= aws_s3_bucket.demo.id
}

#Manually created group, attached 
data "aws_iam_group" "demo-data" {
	group_name = "Demo-group"
}

resource "aws_s3_bucket_policy" "demo-policy" {
	bucket = aws_s3_bucket.demo.id
	policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": "*",
                    "Effect": "Allow",
                    "Resource": "arn:aws:s3:::${aws_s3_bucket.demo.id}/*",
                    "Principal": {
                        "AWS": [
                            "${data.aws_iam_group.demo-data.arn}"
                        ]
                    }
                }
            ]
        }
        EOF
}
