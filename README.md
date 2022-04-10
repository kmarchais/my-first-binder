# my-first-binder

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/kmarchais/my-first-binder/HEAD)

Build docker
``` sudo docker build -t binder . ```

Run shell in docker
``` sudo docker run -i -t binder /bin/bash ```

OR run local jupyter docker 
``` sudo docker run -p 8888:8888 binder ```
