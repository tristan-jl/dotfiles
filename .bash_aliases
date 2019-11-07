# Aliases
alias python='python3'
alias pip='pip3'
alias mvnfull='mvn clean install surefire-report:report site -DgenerateReports=false scala:doc scoverage:report'
alias gitbpurge='git branch --merged | grep -v "(^\*|master|dev|release)" | xargs git branch -d'

# Custom functions                                                                                                                                                                                               
gitf() {                                                                                                                                                                                                         
    git add .                                                                                                                                                                                                    
    git commit -m "$*"
    git push                                                                                                                                                                                                     
} 

gitc() {                                                                                                                                                                                                         
    git checkout "$*"                                                                                                                                                                                             
    git pull                                                                                                                                                                                                     
}

sshemr() {                                                                                                                                                                                                       
    ssh -i ~/Documents/keys/FeatureTeam-prophet.pem hadoop@emr-compute.$1.assistant.natwest.com                                                                                                                  
}

