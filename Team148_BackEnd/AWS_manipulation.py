def build_client():
    client=boto3.client('s3', aws_access_key_id= access_key, aws_secret_access_key=secret_access_key)
    return client

def upload_s3(file, bucket_name, folder_name):
    s3=boto3.client('s3', aws_access_key_id= access_key, aws_secret_access_key=secret_access_key)
    upload_file_bucket=bucket_name
    if folder_name!='':
        upload_file_key=folder_name+'/'+str(file)
    else:
        upload_file_key=str(file)
    s3.upload_file(file, upload_file_bucket, upload_file_key)
    
def remove_file(remove_files):
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    print(remove_files)
    for file in remove_files:
        try:
            os.remove(file)
            print(f'Deleted {file}')
        except Exception as e:
            print(f'File {file} cannot be deleted: {e}')
