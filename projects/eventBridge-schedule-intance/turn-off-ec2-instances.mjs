import { EC2Client, StopInstancesCommand, DescribeInstancesCommand } from "@aws-sdk/client-ec2";

const ec2Client = new EC2Client({ region: "ap-southeast-1" });

export const handler = async (event) => {
    try {
        const describeParams = {
            Filters: [
                {
                    Name: "tag:env",
                    Values: ["dev", "development"]
                },
                {
                    Name: "instance-state-name",
                    Values: ["running"]
                }
            ]
        };

        const data = await ec2Client.send(new DescribeInstancesCommand(describeParams));

        const instanceIds = [];
        data.Reservations.forEach(reservation => {
            reservation.Instances.forEach(instance => {
                instanceIds.push(instance.InstanceId);
            });
        });

        if (instanceIds.length === 0) {
            console.log("not find instance has tag env = dev and state is running")
            return { statusCode: 200, body: "No instances to stop." };
        }

        console.log("find instances", instanceIds)
        const stopParams = { InstanceIds: instanceIds };
        await ec2Client.send(new StopInstancesCommand(stopParams));

        return {
            statusCode: 200,
            body: "stop instances success"
        };

    } catch (err) {
        console.error("stop instances error", err);
        throw err;
    }
};