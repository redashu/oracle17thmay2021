# docker tips

## On docker host 

### non root user can't use docker cli so to do that 

```
 usermod -aG docker  ec2-user
```

### here ec2-user is a non root user 

