# Class: jenkins4php
#
# This module manages jenkins4php
#
# Parameters:
#
# Actions:
#
# Requires:
#  - phpqatools
#  - jenkins
#
# Sample Usage:
#
class jenkins4php {
	include phpqatools
	include jenkins


    	
	# Jenkins plugins
    install-jenkins-plugin {
    	"git-plugin" :
    		name => "git";
    }
    
    install-jenkins-plugin {
    	"checkstyle" :
    		name => "checkstyle";
    }
    
    install-jenkins-plugin {
    	"cobertura" :
    		name => "cobertura";
    }
    
    install-jenkins-plugin {
        "cloverphp" :
            name => "cloverphp";
    }
    
    install-jenkins-plugin {
        "dry" :
            name => "dry";
    }
    
    install-jenkins-plugin {
        "htmlpublisher" :
            name => "htmlpublisher";
    }
    
    install-jenkins-plugin {
        "jdepend" :
            name => "jdepend";
    }
    
    install-jenkins-plugin {
        "plot" :
            name => "plot";
    }
    
    install-jenkins-plugin {
        "pmd" :
            name => "pmd";
    }
    
    install-jenkins-plugin {
        "violations" :
            name => "violations";
    }
    
    install-jenkins-plugin {
        "xunit" :
            name => "xunit";
    }
    
    install-jenkins-plugin {
        "build-pipeline-plugin" :
            name => "build-pipeline-plugin";
    }

	file { "${jenkins_dir}/jobs":
		owner => "jenkins",
		group => "jenkins",
		ensure => directory 
	}
	file { "${jenkins_dir}/jobs/php-template":
		owner => "jenkins",
		group => "jenkins",
		ensure => directory
	}
	file { "${jenkins_dir}/jobs/php-template/config.xml":
		owner => "jenkins",
		group => "jenkins",
		source => "puppet:///modules/jenkins4php/php-template/config.xml",
        notify  => Service['jenkins']
	}
	file { "${jenkins_dir}/jobs/php-template/LICENSE":
		owner => "jenkins",
		group => "jenkins",
		source => "puppet:///modules/jenkins4php/php-template/LICENSE"
	}
	
}
