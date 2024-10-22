terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region                      = local.region
  access_key                  = var.access_key
  secret_key                  = var.access_key
  skip_metadata_api_check     = var.skip_metadata_api_check
  skip_credentials_validation = var.skip_credentials_validation
  endpoints {
    acm                      = lookup(var.endpoints, "acm", null)
    amplify                  = lookup(var.endpoints, "amplify", null)
    apigateway               = lookup(var.endpoints, "apigateway", null)
    apigatewayv2             = lookup(var.endpoints, "apigatewayv2", null)
    appconfig                = lookup(var.endpoints, "appconfig", null)
    appflow                  = lookup(var.endpoints, "appflow", null)
    applicationautoscaling   = lookup(var.endpoints, "applicationautoscaling", null)
    appsync                  = lookup(var.endpoints, "appsync", null)
    athena                   = lookup(var.endpoints, "athena", null)
    autoscaling              = lookup(var.endpoints, "autoscaling", null)
    backup                   = lookup(var.endpoints, "backup", null)
    batch                    = lookup(var.endpoints, "batch", null)
    cloudformation           = lookup(var.endpoints, "cloudformation", null)
    cloudfront               = lookup(var.endpoints, "cloudfront", null)
    cloudsearch              = lookup(var.endpoints, "cloudsearch", null)
    cloudtrail               = lookup(var.endpoints, "cloudtrail", null)
    cloudwatch               = lookup(var.endpoints, "cloudwatch", null)
    cloudwatchlogs           = lookup(var.endpoints, "cloudwatchlogs", null)
    codecommit               = lookup(var.endpoints, "codecommit", null)
    cognitoidentity          = lookup(var.endpoints, "cognitoidentity", null)
    cognitoidp               = lookup(var.endpoints, "cognitoidp", null)
    configservice            = lookup(var.endpoints, "configservice", null)
    costexplorer             = lookup(var.endpoints, "costexplorer", null)
    docdb                    = lookup(var.endpoints, "docdb", null)
    dynamodb                 = lookup(var.endpoints, "dynamodb", null)
    ec2                      = lookup(var.endpoints, "ec2", null)
    ecr                      = lookup(var.endpoints, "ecr", null)
    ecs                      = lookup(var.endpoints, "ecs", null)
    efs                      = lookup(var.endpoints, "efs", null)
    eks                      = lookup(var.endpoints, "eks", null)
    elasticache              = lookup(var.endpoints, "elasticache", null)
    elasticbeanstalk         = lookup(var.endpoints, "elasticbeanstalk", null)
    elasticsearch            = lookup(var.endpoints, "elasticsearch", null)
    elb                      = lookup(var.endpoints, "elb", null)
    elbv2                    = lookup(var.endpoints, "elbv2", null)
    emr                      = lookup(var.endpoints, "emr", null)
    events                   = lookup(var.endpoints, "events", null)
    firehose                 = lookup(var.endpoints, "firehose", null)
    fis                      = lookup(var.endpoints, "fis", null)
    glacier                  = lookup(var.endpoints, "glacier", null)
    glue                     = lookup(var.endpoints, "glue", null)
    iam                      = lookup(var.endpoints, "iam", null)
    iot                      = lookup(var.endpoints, "iot", null)
    iotanalytics             = lookup(var.endpoints, "iotanalytics", null)
    iotevents                = lookup(var.endpoints, "iotevents", null)
    kafka                    = lookup(var.endpoints, "kafka", null)
    keyspaces                = lookup(var.endpoints, "keyspaces", null)
    kinesis                  = lookup(var.endpoints, "kinesis", null)
    kinesisanalytics         = lookup(var.endpoints, "kinesisanalytics", null)
    kinesisanalyticsv2       = lookup(var.endpoints, "kinesisanalyticsv2", null)
    kms                      = lookup(var.endpoints, "kms", null)
    lakeformation            = lookup(var.endpoints, "lakeformation", null)
    lambda                   = lookup(var.endpoints, "lambda", null)
    mediaconvert             = lookup(var.endpoints, "mediaconvert", null)
    mediastore               = lookup(var.endpoints, "mediastore", null)
    mq                       = lookup(var.endpoints, "mq", null)
    mwaa                     = lookup(var.endpoints, "mwaa", null)
    neptune                  = lookup(var.endpoints, "neptune", null)
    opensearch               = lookup(var.endpoints, "opensearch", null)
    organizations            = lookup(var.endpoints, "organizations", null)
    qldb                     = lookup(var.endpoints, "qldb", null)
    ram                      = lookup(var.endpoints, "ram", null)
    rds                      = lookup(var.endpoints, "rds", null)
    redshift                 = lookup(var.endpoints, "redshift", null)
    redshiftdata             = lookup(var.endpoints, "redshiftdata", null)
    resourcegroups           = lookup(var.endpoints, "resourcegroups", null)
    resourcegroupstaggingapi = lookup(var.endpoints, "resourcegroupstaggingapi", null)
    route53                  = lookup(var.endpoints, "route53", null)
    route53domains           = lookup(var.endpoints, "route53domains", null)
    route53resolver          = lookup(var.endpoints, "route53resolver", null)
    s3                       = lookup(var.endpoints, "s3", null)
    s3control                = lookup(var.endpoints, "s3control", null)
    sagemaker                = lookup(var.endpoints, "sagemaker", null)
    scheduler                = lookup(var.endpoints, "scheduler", null)
    secretsmanager           = lookup(var.endpoints, "secretsmanager", null)
    serverlessrepo           = lookup(var.endpoints, "serverlessrepo", null)
    servicediscovery         = lookup(var.endpoints, "servicediscovery", null)
    ses                      = lookup(var.endpoints, "ses", null)
    sesv2                    = lookup(var.endpoints, "sesv2", null)
    sns                      = lookup(var.endpoints, "sns", null)
    sqs                      = lookup(var.endpoints, "sqs", null)
    ssm                      = lookup(var.endpoints, "ssm", null)
    stepfunctions            = lookup(var.endpoints, "stepfunctions", null)
    sts                      = lookup(var.endpoints, "sts", null)
    swf                      = lookup(var.endpoints, "swf", null)
    timestreamwrite          = lookup(var.endpoints, "timestreamwrite", null)
    transcribe               = lookup(var.endpoints, "transcribe", null)
    transfer                 = lookup(var.endpoints, "transfer", null)
    waf                      = lookup(var.endpoints, "waf", null)
    wafv2                    = lookup(var.endpoints, "wafv2", null)
    xray                     = lookup(var.endpoints, "xray", null)
  }

}

module "main_vpc" {
  source     = "./modules/vpc"
  is_public  = true
  cidr_block = "10.2.0.0/16"
  tags = merge(
    local.commom_tags,
    { Name = "teste-${local.env}-main" }
  )
}

module "data_vpc" {
  source     = "./modules/vpc"
  is_public  = false
  cidr_block = "10.2.0.0/16"
  tags = merge(
    local.commom_tags,
    { Name = "teste-${local.env}-data" }
  )
}