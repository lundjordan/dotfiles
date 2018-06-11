function hg_ps1() {
    hg prompt "{ on {branch}}{ at {bookmark}}{status} {rev}" 2> /dev/null
}
