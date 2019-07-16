# Project WebPerf
The WebPerf is an open-sourced web app loading and interacting performance monitoring platform.
> For Notice: This repo is just an installation helper, for furthor purpose, please visit: [WebPerf on Github](https://github.com/web-pf)

## Features
- Fulfilling all the functions that a basic web performance platform should have.
- On-Time performance data updating and visualizing ablibity
- Large-scaled deployment friendly
- Fast and safe data persistance system.
- Using user token for authentication

## Installation

### With `Docker Compose` (suggested)
```bash
# Clone into your target path
mkdir ~/webperf && cd ~/webperf
git clone https://github.com/HJIO/webperf
git clone https://github.com/web-pf/client ./webperf
git clone https://github.com/web-pf/data-staging ./webperf
git clone https://github.com/web-pf/service ./webperf

# build
docker-compose up
```

### For code review and testflight running

Please make sure that you have  all the environments and softwares installed on your machine as follows:

- NodeJS 10+
- Python 3 (with pip3 installed)
- MongoDB Community edition
