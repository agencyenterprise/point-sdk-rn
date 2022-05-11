import React from 'react';
import {Button, Text, View} from 'react-native';
import PointSdkRn from 'react-native-point-sdk';

export function PlaygroundScreen() {
  const getUserHealthMetrics = async () => {
    try {
      const data = await PointSdkRn.getUserHealthMetrics([
        'Vo2Max',
        'TotalWorkoutDuration',
        'TotalMinsHRZone12',
        'TotalMinsHRZone34',
      ]);
      console.log(data);
    } catch (error) {
      console.log(error);
    }
  };

  async function getDailyHistory() {
    try {
      console.log(await PointSdkRn.getDailyHistory(0));
    } catch (error) {
      console.log(error);
    }
  }

  async function getWorkoutsRecommendations() {
    try {
      console.log(
        await PointSdkRn.getWorkoutRecommendations(new Date().toISOString()),
      );
    } catch (error) {
      console.log(error);
    }
  }

  return (
    <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
      <Text style={{fontSize: 18, fontWeight: 'bold'}}>
        Open the console log to see the results
      </Text>
      <Button onPress={getUserHealthMetrics} title="Get User Health Metrics" />
      <Button onPress={getDailyHistory} title="Get Daily History" />
      <Button
        onPress={getWorkoutsRecommendations}
        title="Get Workout Recommendations"
      />
    </View>
  );
}
