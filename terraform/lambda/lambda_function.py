import json

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps('Xin chào từ AWS Lambda được triển khai bởi Terraform!')
    }