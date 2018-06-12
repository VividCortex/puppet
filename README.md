## Puppet Example

### Puppet Master:

Install VividCortex module into:
`code/modules`
or
`code/environments/production/modules/`


#### Configure a node to use the new module
Given an environment named `production`:

`environments/production/manifests/site.pp`:
```
node 'my-host' {
  class { 'vividcortex':
     apitoken => '1234'
  }
}
```

---
### Puppet Client

#### Apply the change on the node
`puppet agent -t`

#### Check to see that it's running:
`service vividcortex status`
