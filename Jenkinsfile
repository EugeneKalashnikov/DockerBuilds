def project = 'EugeneKalashnikov/DockerBuilds'
def branchApi = new URL("https://api.github.com/repos/${project}/branches")
def branches = new groovy.json.JsonSlurper().parse(branchApi.newReader())
branches.each {
    def branchName = it.name
    job {
        name "${project}-${branchName}".replaceAll('/', '-')
        scm {
            git("git://github.com/${project}.git", branchName)
        }
    }
}
