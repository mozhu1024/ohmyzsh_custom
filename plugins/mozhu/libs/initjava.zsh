case "$1" in
    $~(-V|-v|--version))
        /usr/libexec/java_home -V
        return
        ;;
    "1.8")
        export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
        ;;
    "11")
        export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
        ;;
    *)
        export JAVA_HOME="$(/usr/libexec/java_home)"
        ;;
esac
export JRE_HOME=$JAVA_HOME/jre
export CLASSPAHT=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
echo "JAVA_HOME=$JAVA_HOME"