import hudson.slaves.EnvironmentVariablesNodeProperty
import jenkins.model.Jenkins

instance = Jenkins.getInstance()
globalNodeProperties = instance.getGlobalNodeProperties()
envVarsNodePropertyList = globalNodeProperties.getAll(EnvironmentVariablesNodeProperty.class)

newEnvVarsNodeProperty = null
envVars = null

if ( envVarsNodePropertyList == null || envVarsNodePropertyList.size() == 0 ) {
    newEnvVarsNodeProperty = new EnvironmentVariablesNodeProperty();
      globalNodeProperties.add(newEnvVarsNodeProperty)
        envVars = newEnvVarsNodeProperty.getEnvVars()
} else {
    envVars = envVarsNodePropertyList.get(0).getEnvVars()
}

/* This should match env.sh  */
envVars.put("MY_REGISTRY_HOST", "172.17.0.1")
envVars.put("MY_REGISTRY_PORT", "5000")
envVars.put("MY_REGISTRY_USER", "develop")
envVars.put("MY_REGISTRY_PASS", "develop-12345")
instance.save()
