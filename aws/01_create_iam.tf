provider "aws" {
	region 	   = "ap-south-1"
}


resource "aws_iam_user" "admin-user" {
	name = "lucy"
	tags = {
	    Description = " Technical Team Leader"
	}
}

resource "aws_iam_policy" "adminUser" {
	name = "AdminUser"
	policy = <<EOF
 {
   "Version": "2012-10-17",
   "Statement": [
     {
       "Action": "*",
       "Effect": "Allow",
       "Resource": "*"
     }

    ]
  }
 EOF
}


resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
	user       = aws_iam_user.admin-user.name
	policy_arn = aws_iam_policy.adminUser.arn
}



############################################


resource "aws_iam_user" "DEV-user" {
        name = "Sami"
        tags = {
            Description = "Team Leader"
        }
}


resource "aws_iam_policy" "DEVadminUser" {
        name = "DevAdminUser"
        policy = file("DevAdmin-policy.json")

  }

resource "aws_iam_user_policy_attachment" "Sami-admin-access" {
        user       = aws_iam_user.DEV-user.name
        policy_arn = aws_iam_policy.DEVadminUser.arn
}
		

