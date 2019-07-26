# learn-codebuild

Labs helping you to learn AWS CodeBuild within an hour.

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

The command will return some information about your repository.
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

```
git remote add deploy https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/learn-codebuild-andreas
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
