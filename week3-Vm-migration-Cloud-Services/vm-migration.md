# Import your VM as an image

- After exporting your VM from your virtualization environment, you can import it to Amazon EC2. The import process is the same regardless of the origin of the VM.

- if you dont have any **VM Images** then use this link and download VMDK or OVA images
- https://www.linuxvmimages.com/images/rockylinux-9/


## Tasks

- Prerequisites
- Upload the image to Amazon S3
- Import the VM


## Prerequisites

- Create an Amazon S3 bucket for storing the exported images or choose an existing bucket. The bucket must be in the Region where you want to import your VMs. For more information about S3 buckets, see the Amazon Simple Storage Service User Guide.

- download AWS CLI for windows and install it
- Create IAM root keys and configure it using aws configure command

- Create an IAM role named vmimport. For more information, see Required service role.

- If you have not already installed the AWS CLI on the computer you'll use to run the import commands, see the AWS Command Line Interface User Guide.

> Tip
> In supported AWS Regions, you can also use AWS CloudShell for a browser-based, pre-authenticated shell that launches directly from the AWS Management Console.

# create IAM User
```
aws iam create-role --role-name vmimport --assume-role-policy-document "file://C:\import\trust-policy.json"
```
- Now create a file name role-policy.json with the following policy
```
aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document "file://C:\import\role-policy.json"

```

## Upload the image to Amazon S3

Upload your VM image file to your Amazon S3 bucket using the upload tool of your choice. For information about uploading objects through the Amazon S3 console, see Uploading Objects.

## Import the VM

After you upload your VM image file to Amazon S3, you can use the AWS CLI to import the image. These tools accept either the Amazon S3 bucket and path to the file or a URL for a public Amazon S3 file. Private Amazon S3 files require a presigned URL.

The following examples use the AWS CLI command import-image to create import tasks.

### Example 1: Import an image with a single disk

Use the following command to import an image with a single disk.

```
aws ec2 import-image --description "My server VM" --disk-containers "file://C:\import\containers.json"

```

- The following is an example containers.json file that specifies the image using an S3 bucket.
```
[
  {
    "Description": "My Server vmdk",
    "Format": "vmdk",
    "UserBucket": {
        "S3Bucket": "cnl-import-bucket",
        "S3Key": "Ubuntu-Server.vmdk"
    }
  }
]

```
- The following is an example containers.json file that specifies the image using a URL in Amazon S3.

```
[
  {
    "Description": "My Server OVA",
    "Format": "ova",
    "Url": "s3://cnl-import-bucket/vms/my-server-vm.ova"
  }
]
```


### Example 2: Import an image with multiple disks

- Use the following command to import an image with multiple disks.
```
$ C:\> aws ec2 import-image --description "My server disks" --disk-containers "file://C:\import\containers.json"
```

- The following is an example containers.json file.
```
[
  {
    "Description": "First disk",
    "Format": "vmdk",
    "UserBucket": {
        "S3Bucket": "cnl-import-bucket",
        "S3Key": "disks/my-server-vm-disk1.vmdk"
    }
  },          
  {
    "Description": "Second disk",
    "Format": "vmdk",
    "UserBucket": {
        "S3Bucket": "cnl-import-bucket",
        "S3Key": "disks/my-server-vm-disk2.vmdk"
    }
  }
]
```

### Example 3: Import with the encrypted option enabled

- Use the following command to import an image with an encrypted root volume.
```
aws ec2 import-image --description "My server disks" --encrypted --kms-key-id 0ea3fef3-80a7-4778-9d8c-1c0c6EXAMPLE --disk-containers "file://C:\import\containers.json"

```

- The CMK provided for encryption must not be disabled during the entire import process. For more information, see Amazon EBS Encryption in the Amazon EC2 User Guide.

### Monitor an import image task
- Use the describe-import-image-tasks command to return the status of an import task.

```
aws ec2 describe-import-image-tasks --import-task-ids import-ami-0ece1cae5977c5192
```


#### Status values include the following:

- active — The import task is in progress.

- deleting — The import task is being canceled.

- deleted — The import task is canceled.

- updating — Import status is updating.

- validating — The imported image is being validated.

- validated — The imported image was validated.

- converting — The imported image is being converted into an AMI.

- completed — The import task is completed and the AMI is ready to use.


- After the import image task is completed, the output includes the ID of the AMI. The following is example output that includes ImageId.

```
{
    "ImportImageTasks": [
        {
            "ImportTaskId": "import-ami-01234567890abcdef",
            "ImageId": "ami-1234567890EXAMPLE",
            "SnapshotDetails": [
                {
                    "DiskImageSize": 705638400.0,
                    "Format": "ova",
                    "SnapshotId": "snap-111222333444aaabb"
                    "Status": "completed",
                    "UserBucket": {
                        "S3Bucket": "cnl-import-bucket",
                        "S3Key": "vms/my-server-vm.ova"
                    }
                }
            ],
            "Status": "completed"
        }
    ]
}

```

### Cancel an import image task
- If you need to cancel an active import task, use the cancel-import-task command.

```
aws ec2 cancel-import-task --import-task-id import-ami-1234567890abcdef0
```