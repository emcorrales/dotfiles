#!/usr/bin/python3
import sys
import boto3

ec2 = boto3.resource('ec2')
vpc_id = sys.argv[1]

print("Deleting ", vpc_id, "...")
vpc = ec2.Vpc(vpc_id)

if vpc.is_default:
    print("VPC is default and cannot be deleted.")
    exit()

def detach_internet_gateway(vpc):
    internet_gateway_iterator = iter(vpc.internet_gateways.all())
    while internet_gateway_iterator:
        try:
            internet_gateway = next(internet_gateway_iterator)
            response = internet_gateway.detach_from_vpc(
                DryRun=False,
                VpcId=vpc_id
            )
        except StopIteration:
            break


def remove_routes():
    route_table_iterator = iter(vpc.route_tables.all())
    while route_table_iterator:
        try:
            is_main = False
            route_table = next(route_table_iterator)
            association_iterator = iter(route_table.associations)
            while association_iterator:
                try:
                    association = next(association_iterator)
                    is_main = association.main
                    if not association.main:
                        association.delete()
                    else:
                        break
                except StopIteration:
                    break
            # route = ec2.Route(route_table.route_table_id, '0.0.0.0/0')
            # route.delete()
            if not is_main:
                route_table.delete()
        except StopIteration:
            break

def remove_security_groups():
    security_group_iterator = iter(vpc.security_groups.all())
    while security_group_iterator:
        try:
            security_group = next(security_group_iterator)
            if not security_group.group_name == 'default':
                security_group.delete()
        except StopIteration:
            break

def remove_subnets():
    subnet_iterator = iter(vpc.subnets.all())
    while subnet_iterator:
        try:
            subnet = next(subnet_iterator)
            subnet.delete()
        except StopIteration:
            break

def terminate_instances():
    instance_iterator = iter(vpc.instances.all())
    while instance_iterator:
        try:
            instance = next(instance_iterator)
            instance.terminate()
            instance.wait_until_terminated()
        except StopIteration:
            break

terminate_instances()
remove_routes()
remove_subnets()
remove_security_groups()
detach_internet_gateway(vpc)
vpc.delete()

