# learn-codebuild

Labs helping you to learn AWS CodeBuild within an hour.

> :books: Check out our new book [Rapid Docker on AWS](https://cloudonaut.io/rapid-docker-on-aws/?utm_source=learn-codebuild&utm_medium=doc&utm_campaign=readme)
> * Written for DevOps engineers and web developers who want to run dockerized web applications on AWS.
> * Prior knowledge of Docker and AWS is not required.
> * Continuous Deployment of your Web Application and Infrastructure as Code.

Are you looking for an instructor-led workshop based on these labs? Say [hello@widdix.net](mailto:hello@widdix.net).

## Labs

* [Lab 01: Build and push a Docker image with CodeBuild](lab01-codebuild-ecr/)
* [Lab 02: Integrate CodeBuild into CodePipeline](lab02-codebuild-codepipeline/)

## Setup your personal lab environment

Clone this repository on your local machine.

```
git clone https://github.com/widdix/learn-codebuild.git
```

Create a CodeCommit repository. Replace `$user` with your name (e.g. `andreas`).

```
aws codecommit create-repository --repository-name learn-codebuild-$user
```

The command will return some information about your CodeCommit repository.

```
{
    "repositoryMetadata": {
        "accountId": "111111111111",
        "repositoryId": "c1998fd8-2c78-4a73-984c-53d588a6b237",
        "repositoryName": "learn-codebuild-andreas",
        "lastModifiedDate": 1541665280.947,
        "creationDate": 1541665280.947,
        "cloneUrlHttp": "https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/learn-codebuild-andreas",
        "cloneUrlSsh": "ssh://git-codecommit.eu-west-1.amazonaws.com/v1/repos/learn-codebuild-andreas",
        "Arn": "arn:aws:codecommit:eu-west-1:111111111111:learn-codebuild-andreas"
    }
}
```

Execute the following command to add a new remote named `deploy` to your cloned repository. Replace `$cloneUrlHttp` with the output from the previous command.

```
git remote add deploy $cloneUrlHttp
```

Edit `.git/config` and add.

```
[credential]
    helper =
    helper = !aws codecommit credential-helper $@
    UseHttpPath = true
```

```
git push deploy master
```

Create an ECR repository. Replace `$user` with your name (e.g. `andreas`).

```
aws ecr create-repository --repository-name learn-codebuild-$user
```

The command will return some information about your ECR repository.

```
{
    "repository": {
        "repositoryArn": "arn:aws:ecr:eu-central-1:575632519744:repository/learn-codebuild-andreas",
        "registryId": "575632519744",
        "repositoryName": "learn-codebuild-andreas",
        "repositoryUri": "575632519744.dkr.ecr.eu-central-1.amazonaws.com/learn-codebuild-andreas",
        "createdAt": 1568963927.0,
        "imageTagMutability": "MUTABLE"
    }
}
```

Note down the `repositoryUri`.

## Clean up

Make sure you are deleting all the resources created while going through the labs.

* Delete the ECR registry `learn-codebuild-$user`.
* Delete the CodeCommit repository `learn-codebuild-$user`.
* Delete the CodeBuild project `learn-codebuild-$user`.
* Delete the CodePipeline pipeline `learn-codebuild-$user`.
* Delete the IAM policy `CodeBuildBasePolicy-learn-codebuild-$user-$region`.
* Delete the IAM role `codebuild-learn-codebuild-$user-service-role`.
* Delete the IAM role `AWSCodePipelineServiceRole-eu-west-1-learn-codebuild-$user`

## More Labs

See [widdix/learn-codepipeline](https://github.com/widdix/learn-codepipeline) for labs to learn AWS CodePipeline.

## Credits

The labs include a website example based on Identity from [html5up.net | @ajlkn](https://html5up.net).


## More Labs

We offer AWS workshops tailored to your needs. See [widdix/learn-*](https://github.com/widdix?q=learn-) for more labs.
