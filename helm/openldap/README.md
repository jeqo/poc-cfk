# OpenLDAP

## How to test

```
kubectl exec -n openldap -it ldap-0 -- bash
```

```
ldapsearch -LLL -x -H ldap://ldap.openldap.svc.cluster.local:389 \
        -b 'dc=test,dc=com' \
        -D "cn=devmds,dc=test,dc=com" \
        -w 'Developer!' \
	cn
```
