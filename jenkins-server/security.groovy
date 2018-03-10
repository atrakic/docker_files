#!groovy
import jenkins.model.*
import hudson.security.*

def env = System.getenv()
def instance = Jenkins.getInstance()
println "--> creating local user: 'env.JENKINS_USER'"

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount(env.JENKINS_USER, env.JENKINS_PASS)
instance.setSecurityRealm(hudsonRealm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
instance.setAuthorizationStrategy(strategy)
instance.save()
