# mockoon-demo
showcase mocking API using mockoon

Blog post: https://blog.shanelee.name/2021/08/29/mocking-a-rest-api-the-api-first-way-with-mockoon/
## dockerise version 1.4.0 (detached mode)

```bash
npm update -g @mockoon/cli@1.4.0
mockoon-cli dockerize --data ./Greetings_Mockoon.json --port 3000 --index 0 --output ./Dockerfile

#Then manually amend the docker file to add in detached mode and specify the data arg. see [Dockerfile](./Dockerfile)

#To run with transaction log
docker run -p 3000:3000 mockoon-greeting-api --log-transaction

```
