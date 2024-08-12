# GitLab Runner With Windows Installation Notes

## Runner Install

### 1. Preparation

- Git from the official site needs to be downloaded and installed. [download](https://git-scm.com/download/win).

- Create a folder somewhere in your system, example: `C:\GitLab-Runner`.

- Download the binary for [64-bit](https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/binaries/gitlab-runner-windows-amd64.exe) or [32-bit](https://s3.dualstack.us-east-1.amazonaws.com/gitlab-runner-downloads/latest/binaries/gitlab-runner-windows-386.exe)

- Let's change the name of the file we downloaded to `gitlab-runner.exe`.

- Put the downloaded file into the folder you created. `C:\GitLab-Runner\gitlab-runner.exe`.

***

### 2. Install

Open cmd and run code

```bash
cd C:\GitLab-Runner

.\gitlab-runner.exe install

.\gitlab-runner.exe start
```

***

### 3. Register Prerequisites

You can get a token by going to a project in your gitlab instance.

- Open gitlab.example.com

- Open project page.

- `Settings > CI/CD > Runners` come to the section.

- New project runner for windows

- Check `[x] Run untagged jobs` if you are not working with tags

- Get token example: `glrt-****`

### 4. Register

Open cmd and interactive register

```bash
cd C:\GitLab-Runner 

# Register
# The executor to be used here can be customized
.\gitlab-runner.exe register --non-interactive --description runnerName --url https://gitlab.example.com  --token glrt-***-*** --executor shell --shell powershell

# Manually verify that the runner is available to pick up jobs.
.\gitlab-runner.exe run
``` 

After this stage `Settings > CI/CD > Runners` in this section you can see that the runner is online.
