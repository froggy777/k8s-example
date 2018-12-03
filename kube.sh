#!/bin/bash
help(){
echo "Use kube.sh with next commands:"
echo "start|stop|restart|reload"
}


start(){
kubectl create -f deployments/node.yml
kubectl create -f services/node.yml
kubectl create -f deployments/nginx.yml
kubectl create -f services/nginx.yml
kubectl create -f deployments/php.yml
kubectl create -f services/php.yml
}

stop(){
kubectl delete -f deployments/node.yml
kubectl delete -f services/node.yml
kubectl delete -f deployments/nginx.yml
kubectl delete -f services/nginx.yml
kubectl delete -f deployments/php.yml
kubectl delete -f services/php.yml

}
reload(){
kubectl apply -f deployments/node.yml
kubectl apply -f services/node.yml
kubectl apply -f deployments/nginx.yml
kubectl apply -f services/nginx.yml
kubectl apply -f deployments/php.yml
kubectl apply -f services/php.yml
}
restart(){
stop
start
}
if [[ -z $1 ]]
then
help
exit 1
fi


case $1 in
start)
	echo "Starting..."
	start
	echo "Started!"
	;;
	stop)
	echo Stoping...
	stop
	echo Stoped
	;;
	restart)
	echo Restarting...
	restart
	echo Restarted
	;;
        reload)
        echo Reloading...
        reload
        echo Reloaded
        ;;
        help)
        help
        ;;

*)
echo don\'t know this command
help
exit 1
;;
esac





