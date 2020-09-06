variable "region" {
  type = string
  default = "us-east-1"
  description = "aws region"
}

variable "sns_topic_name" {
  type = string
  default = "my_sns"
  description = "sns topic name"
}

variable "sns_subscription_email_address_list" {
  type = string
  default = "dayanand151@gmail.com"
  description = "List of email addresses as string(space separated)"
}

    variable "member_account_ids" {
      type = "list"
      default =["414672581642"]
    }
    variable "member_account_emails" {
      type = "list"
     default = ["ritamdoc151@gmail.com"]
    }
