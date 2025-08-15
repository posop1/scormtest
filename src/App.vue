<script setup lang="ts">
import { Scorm12API } from 'scorm-again';
import { nextTick, onMounted, ref } from 'vue';

const isLoading = ref(false);

onMounted(async () => {
  isLoading.value = true;

  const settings = {
    logLevel: 1,
    autocommit: true,
  };

  try {
    // @ts-ignore
    window.API = {
      ...new Scorm12API(settings),
      cmi: {
        ...new Scorm12API(settings).cmi,
        core: {
          ...new Scorm12API(settings).cmi.core,
          student_id: '43',
          student_name: 'postop pposdf',
          credit: 'credit',
          entry: 'ab-initio',
          lesson_status: 'incomplete',
        },
        suspend_data: '',
      },
    };
  } catch (error) {
    console.log(error);
  }
  // @ts-ignore

  nextTick();
  setTimeout(() => {
    isLoading.value = false;
  }, 5000);
});

console.log(window);
</script>

<template>
  <div
    v-if="!isLoading"
    id="scorm-wrapper"
    style="width: 100%; height: 600px; border: 1px solid #ddd; border-radius: 4px">
    <iframe
      src="https://sa.eu.brusnika-apps.com//local/scorm/artur.yakhin52@gmail.com/9738/index.html"
      frameborder="0"
      allowfullscreen
      width="100%"
      height="100%"
      title="SCORM контент"></iframe>
  </div>
  <div v-else>loading</div>
</template>

<style scoped></style>
