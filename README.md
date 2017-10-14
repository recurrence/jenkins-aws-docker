# Jenkins for AWS ECS + Docker + AWS CLI 

## Getting Started
1.  Build image
2.  Push to docker registry
3.  Deploy to ECS

## Misc
This is an extension of the jenkins lts image.

ECS defaults docker to GID 497, if that changes this will cease to work.  A potential workaround is to give jenkins sudo privileges.
