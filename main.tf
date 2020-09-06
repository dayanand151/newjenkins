provider "aws" {
  region = var.region
}

resource "aws_sns_topic" "tf_aws_sns_topic_with_subscription" {
  name = var.sns_topic_name
  provisioner "local-exec" {
    command = "sh sns_subscription.sh"
    environment = {
      sns_arn = self.arn
      sns_emails = var.sns_subscription_email_address_list
    }
  }
}

#resource "aws_guardduty_detector" "master" {
#  enable = true
#}

#resource "aws_guardduty_detector" "member" {
 # provider = "aws.dev"

 # enable = true
#}

#resource "aws_guardduty_member" "member" {
#  account_id         = "${aws_guardduty_detector.member.account_id}"
#  detector_id        = "${aws_guardduty_detector.master.id}"
#  email              = "aryad0525@gmail.com"
#  invite             = true
#  invitation_message = "please accept guardduty invitation"
#}


   # resource "aws_guardduty_detector" "master" {
   #   enable = true
   # }
    resource "aws_guardduty_member" "prod_member" {
      count              = "${length(var.member_account_ids)}"
      detector_id        = "1eb935070a04f7f05f39123bd2b6d411"
      account_id         = "${element(var.member_account_ids, count.index)}"
      email              = "${element(var.member_account_emails, count.index)}"
      invite             = true
      invitation_message = "GuardDuty Invite - Please accept this invitation if you are expecting it."
    }
